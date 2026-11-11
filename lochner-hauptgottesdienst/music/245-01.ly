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
      \new Voice = "soprano" { \voiceOne a'2 c''2 \bar "|" d''2 c''2 \bar "|" f''2(^\markup \tiny "Chor." e''4 d''4 \bar "|" c''2) a'4( bes'4) \bar "|" c''2 bes'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'2 g'2 bes'2 a'2 f'2( a'4 f'4~ f'4 e'4) f'2 e'2 d'4( e'4) }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t dei -- ner Eh -- "re!" Ho \skip 1 \skip 1 \skip 1 si \skip 1 an na }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne d'2 e'2 f'2 f'2 a4( bes4 c'4 bes8[ a8] g2) f2 g4( a4) bes2 }
      \new Voice = "bass" { \voiceTwo d2 c2 bes,2 f2 f2( a,4 bes,4 c2) d2 c2 g2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
