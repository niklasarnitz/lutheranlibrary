\version "2.24.3"
% Lochner, V. Sanctus. Source pages 223–224.
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
      \clef treble \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne c''2(^\markup \tiny "Feierlich. Gemeinde." bes'4 c''4) \bar "|" a'2 r2 \bar "|" c''2( bes'4 c''4) \bar "|" a'2 r2 \bar "|" c''2 g'4 a'4 \bar "|" bes'2. g'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'2( d'4 e'4) f'2 s2 f'2.( g'4) f'2 s2 f'2 e'4 f'4 f'2. e'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Hei \skip 1 \skip 1 "lig," hei \skip 1 \skip 1 "lig," hei -- lig ist "Gott," der }
    \new Staff <<
      \clef bass \global \cadenzaOn
      \new Voice { \voiceOne a2( g2) c'2 r2 a2 d'4 c'4 c'2 r2 c'4( a4) c'4 c'4 d'2. c'4 }
      \new Voice = "bass" { \voiceTwo f2( g4 c4) f,2 s2 f2. e4 f2 s2 a,4( f,4) c4 f4 bes,2. c4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
