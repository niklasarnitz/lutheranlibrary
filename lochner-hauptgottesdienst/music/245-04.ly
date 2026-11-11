\version "2.24.3"
% Lochner, II. Sanctus minus summum. Source pages 219–220.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne c''2 bes'2 \bar "|" a'2 g'4( a'4) \bar "|" f'4( g'4 f'2) \bar "|" f'1 \bar "|." }
      \new Voice = "alto" { \voiceTwo e'2 d'4( e'4) f'2 g'4( f'4) c'2( d'2) c'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t an na in der \skip 1 Hö \skip 1 \skip 1 "he!" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne g4( a4) bes2 c'2 c'2 a4( g4 a4 bes4~ bes4) a8[ g8] a2 }
      \new Voice = "bass" { \voiceTwo c2 g2 f2 e4( f4) f4( e4 d2) f1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
